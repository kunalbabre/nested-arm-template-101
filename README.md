# Alternative approach to working with nested ARM templates

Using Azure Resource Manager templates (JSON format) is an easy and reliable way to deploy resources on Azure. It allows for codifying the infrastructure and version controlling every change to it a.k.a. Infrastructure-as-Code (IaC).

A single template can deploy hundreds of resources, however there are limits on the physical size and parameters (see [Template limits section](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits)). From a maintainability perspective, it may not always be a good idea to build one gigantic template. There is a lot of [good material](http://download.microsoft.com/download/8/E/1/8E1DBEFA-CECE-4DC9-A813-93520A5D7CFE/World%20Class%20ARM%20Templates%20-%20Considerations%20and%20Proven%20Practices.pdf) written on the [single vs nested](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-template-best-practices#single-template-vs-nested-templates) templates.

Now that we have decided to build a nested template and probably quickly scrambled an example together, we might next stumble upon how to run this sample, since references to nested templates are required to be accessible publicly. 

A very commonly used way is to host it on the public Git repository and hard reference the URIs, however templates are also hosted on an Azure storage account as an alternative approach described [here](https://docs.microsoft.com/en-us/azure/vs-azure-tools-resource-groups-ci-in-vsts?toc=%2fazure%2fazure-resource-manager%2ftoc.json).


Discussed below is another alternative, which comes handy when experimenting, learning and testing changes quickly without having to push code either on Git or on a storage account.

## Preparation (one off)

- Install Node.js (if you don’t have it already!) - https://nodejs.org/en/download/
    
    ```Download and run, it has pre-built installer so not much to do!```

- Install http-server and NPM package - https://www.npmjs.com/package/http-server
    
    ```npm install -g http-server```

- Download and unzip ngrok on your local machine let’s say c:\ngrok
 
## Running the Scripts (once for each session)

1. Download a sample copy of the nested scripts from https://github.com/kunalbabre/nested-arm-template-101 into `c:\nested-arm-template-101`
2. Open `c:\nested-arm-template-101` folder in command prompt 
3. Type `http-server` and hit enter 
4. Next note the port number it is running on - you will get something like  http://127.0.0.1:`8080` where `8080` is the port where our site is getting served locally
5. Now open a second command prompt window 
6. Type `cd c:\ngrok`and hit enter 
7. Type `Ngork.exe http 8080` and hit enter to serve the files externally
8. Next note the unique subdomain name - you will get something like https://`c1a178dc`.ngrok.io, copy `c1a178dc`
9. Open the PowerShell script `c:\nested-arm-template-101\sampleDeploy.ps1` in PowerShell ISE
10. Replace `<ngrok-subDomainName>` with one you noted in step 8 above
### (As required)
11.	Run (hit `F5`)
12. Provide your Azure account details (`Login-AzureRmAccount` command on PowerShell required only once)
13. Once the script has been successfully deployed you will be able to see the App Service Plan and the Website created under Azure portal 
14. Browser to the website http://`c1a178dc`-test-site-name.azurewebsites.net/
