package test

import (
	"testing"
	"fmt"
	"strings"
	"github.com/aws/aws-sdk-go/service/ecs"
    "github.com/gruntwork-io/terratest/modules/random"
    testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func AddPreAndSuffix(resourceName string, resourcePrefix string, resourceSuffix string) string {
	if resourcePrefix == "" {
		resourcePrefix = "dataroots"
	}
	if resourceSuffix == "" {
		resourceSuffix = "dev"
	}
	return fmt.Sprintf("%s-%s-%s", resourcePrefix, resourceName, resourceSuffix)
}

func GetContainerWithName(containerName string, containers []*ecs.Container) *ecs.Container {
	for _, container := range containers {
		if *container.Name == containerName {
			return container
		}
	}
	return nil
}

func getDefaultTerraformOptions(t *testing.T, resourcePrefix string, resourceSuffix string) (*terraform.Options, error) {
	tempTestFolder := testStructure.CopyTerraformFolderToTemp(t, "..", ".")

	terraformOptions := &terraform.Options{
		TerraformDir:       tempTestFolder,
		Vars:               map[string]interface{}{},
    }
    terraformOptions.Vars["resource_prefix"] = resourcePrefix
    terraformOptions.Vars["resource_suffix"] = resourceSuffix
    return terraformOptions, nil
}


func TestTerraformHelloWorldExample(t *testing.T) {

    resourcePrefix := "dtr"
    resourceSuffix :=  strings.ToLower(random.UniqueId())
    options, err := getDefaultTerraformOptions(t, resourcePrefix, resourceSuffix)
	assert.NoError(t, err)
    // terraform destroy => when test completes
	defer terraform.Destroy(t, options)
	fmt.Println("Running: terraform init && terraform apply")
	_, err = terraform.InitE(t, options)
	assert.NoError(t, err)
	_, err = terraform.PlanE(t, options)
	assert.NoError(t, err)
	_, err = terraform.ApplyE(t, options)
	assert.NoError(t, err)

	// if there are terraform errors, do nothing
	if err == nil {
		fmt.Println("Terraform apply returned no error, continuing")
	}
}
