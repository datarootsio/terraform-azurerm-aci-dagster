package test

 import (
 	"fmt"
// 	"io/ioutil"
// 	"net/http"
// 	"net/http/cookiejar"
// 	"net/url"
// 	"strings"
// 	"testing"
// 	"time"
//
// 	"github.com/PuerkitoBio/goquery"
//
// 	"github.com/aws/aws-sdk-go/service/ecs"
// 	"github.com/aws/aws-sdk-go/service/iam"
//
// 	"github.com/gruntwork-io/terratest/modules/aws"
// 	"github.com/gruntwork-io/terratest/modules/logger"
// 	"github.com/gruntwork-io/terratest/modules/random"
// 	"github.com/gruntwork-io/terratest/modules/terraform"
// 	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
// 	"github.com/stretchr/testify/assert"
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
