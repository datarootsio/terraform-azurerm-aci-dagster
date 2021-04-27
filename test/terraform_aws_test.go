package test

import (
	"strings"
	"testing"
	"time"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func getDefaultTerraformOptions(t *testing.T, resource_prefix string, resource_suffix string) (*terraform.Options, error) {

	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, "..", "test/test_module")

	terraformOptions := &terraform.Options{
		TerraformDir: tempTestFolder,
		Vars:         map[string]interface{}{},
		RetryableTerraformErrors: map[string]string{
			},
		MaxRetries:         5,
		TimeBetweenRetries: 5 * time.Minute,
		NoColor:            true,
		Logger:             logger.TestingT,
	}

	terraformOptions.Vars["resource_prefix"] = resource_prefix
	terraformOptions.Vars["resource_suffix"] = resource_suffix

	return terraformOptions, nil
}

func TestApplyAndDestroy(t *testing.T) {
    resourcePrefix := "dtr"
    resourceSuffix :=  strings.ToLower(random.UniqueId())
	t.Parallel()
	options, err := getDefaultTerraformOptions(t, resourcePrefix, resourceSuffix)
	assert.NoError(t, err)

	defer terraform.Destroy(t, options)
	_, err = terraform.InitAndApplyE(t, options)
	assert.NoError(t, err)
}