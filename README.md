# Azure Pipelines Agent Images and GitHub Actions Runner Images

## Status

[![Super Linter](<https://github.com/segraef/apai/actions/workflows/linter.yml/badge.svg>)](<https://github.com/segraef/apai/actions/workflows/linter.yml>)

[![GitHub Runner Image Workflow](<https://github.com/segraef/apai/actions/workflows/workflow.yml/badge.svg>)](<https://github.com/segraef/apai/actions/workflows/workflow.yml>)

## About

This repository contains a simplified version of pre-defined Azure Pipelines and GitHub Workflows used to create VM images for [GitHub-hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners) used for Actions, as well as for [Microsoft-hosted agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops#use-a-microsoft-hosted-agent) used for Azure Pipelines.

## Available Images

| Image | Pipeline/Workflow Label | Included Software |
| --------------------|---------------------|--------------------|
| Ubuntu 22.04 | `Ubuntu2204` | [ubuntu-22.04]
| Ubuntu 20.04 | `Ubuntu2004` | [ubuntu-20.04]
| Ubuntu Minimal | `UbuntuMinimal` |
| Windows Server 2022 | `Windows2022` | [windows-2022]
| Windows Server 2019 | `Windows2019` | [windows-2019]

[ubuntu-minimal]: https://github.com/actions/runner-images/blob/main/images/linux/Ubuntu2204-Readme.md
[ubuntu-22.04]: https://github.com/actions/runner-images/blob/main/images/linux/Ubuntu2204-Readme.md
[ubuntu-20.04]: https://github.com/actions/runner-images/blob/main/images/linux/Ubuntu2004-Readme.md
[windows-2022]: https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md
[windows-2019]: https://github.com/actions/runner-images/blob/main/images/win/Windows2019-Readme.md

## Reporting Issues and Feedback

### Issues and Bugs

If you find any bugs, please file an issue in the [GitHub Issues][GitHubIssues] page. Please fill out the provided template with the appropriate information.

If you are taking the time to mention a problem, even a seemingly minor one, it is greatly appreciated, and a totally valid contribution to this project. **Thank you!**

## Feedback

If there is a feature you would like to see in here, please file an issue or feature request in the [GitHub Issues][GitHubIssues] page to provide direct feedback.

## Contribution

If you would like to become an active contributor to this repository or project, please follow the instructions provided in [`CONTRIBUTING.md`][Contributing].

## Learn More

* [GitHub Documentation][GitHubDocs]
* [Azure DevOps Documentation][AzureDevOpsDocs]
* [Microsoft Azure Documentation][MicrosoftAzureDocs]

<!-- References -->

<!-- Local -->
[ProjectSetup]: <https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions>
[CreateFromTemplate]: <https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-repository-from-a-template>
[GitHubDocs]: <https://docs.github.com/>
[AzureDevOpsDocs]: <https://docs.microsoft.com/en-us/azure/devops/?view=azure-devops>
[GitHubIssues]: <https://github.com/segraef/Template/issues>
[Contributing]: CONTRIBUTING.md

<!-- External -->
[Az]: <https://img.shields.io/powershellgallery/v/Az.svg?style=flat-square&label=Az>
[AzGallery]: <https://www.powershellgallery.com/packages/Az/>
[PowerShellCore]: <https://github.com/PowerShell/PowerShell/releases/latest>

<!-- Docs -->
[MicrosoftAzureDocs]: <https://docs.microsoft.com/en-us/azure/>
[PowerShellDocs]: <https://docs.microsoft.com/en-us/powershell/>
