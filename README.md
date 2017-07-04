# Working with Nested ARM Templates

Azure Resource Manager templates (JSON format) are easy and reliable way to deploy resources on Azure. It allows you to codify your infrastructure and version control every change to it aka Infrastructure-as-Code or IaC in short.

A single template, in theory, can deploy 100’s of components, there are limits on the physical size of template, parameters etc (see [Template limits section](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits)). However just because you can, it is not always a good idea to build one gigantic template from a maintainability perspective. You can find a lot of good material written on the [Azure website](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-template-best-practices#single-template-vs-nested-templates).

So now that you have decided to build nested template and quickly scrambled and example together you will stumble upon how do I run this sample. Nested templates are required to be accessible publicly. 

First and simplest option is to host it on public git repository and hard reference the URIs, however, if you do not wish to do that you can host templates on Azure storage account and generate SAS tokens to access them for a limited time see [here](https://docs.microsoft.com/en-us/azure/vs-azure-tools-resource-groups-ci-in-vsts?toc=%2fazure%2fazure-resource-manager%2ftoc.json).


There is also a third way, very handy when wanting to experiment, learn and test changes quickly without doing first two.

## Preparation (one-time)

- Install Node.js (if you don’t have it already!) - https://nodejs.org/en/download/
    
    ```Download and run, it has pre-built installer so not much to do!```

- Install http-server and NPM package - https://www.npmjs.com/package/http-server
    
    ```npm install -g http-server```

- Download and unzip ngrok on your local machine let’s say c:\ngrok
 
## Running the Scripts

1. Download sample nested scripts from https://github.com/kunalbabre/nested-arm-template-101 into `c:\nested-arm-template-101`
2. Open `c:\nested-arm-template-101` folder in command prompt 
3. Run `http-server` 
4. Note port number it is running on - you will get something like  http://127.0.0.1:`8080` note `8080` is port where our site is getting served locally
5. Now open second command prompt, to serve the files externally 
6. Type `cd c:\ngrok`
7. Type `Ngork.exe http 8080`
8. Note the unique subdomain name - you will get something like this https://`c1a178dc`.ngrok.io copy `c1a178dc`
9. Open the PowerShell script `c:\nested-arm-template-101\sampleDeploy.ps1` in PowerShell ISE
10. Replace `<ngrok-subDomainName>` with one you noted in step above
11.	Run (hit `F5`)
12. Provide your Azure account details
13. Once script is successfully deployed you will be able to see App Service Plan and Website created in Azure portal 
14. Browser to the site http://`c1a178dc`-test-site-name.azurewebsites.net/

