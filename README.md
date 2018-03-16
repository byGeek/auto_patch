# auto_patch
This repo is a simple powershell script to generate patch file between different release package.



##  Usage

1. First of all, you should install `Beyond compare`, and then copy the installation path. Usually in windows, the path will be 

   `C:\Program Files (x86)\Beyond Compare 4\BCompare.exe`

2. Replace your installation path in `bc_auto_generate.ps1`

3. Replace your release package folder.

4. Copy `bc_auto.txt` file to your release package folder. You can name it whatever you like. But don't forget to change it in `bc_auto_generate.ps1`

5. Copy `bc_auto_generate.ps1` to your release package folder with `$bc_path`, `$directory`, `$bc_script_name` properly set.

6. Open a powershell prompt and execute. 



## Customization

Be default, `bc_auto_generate.ps1` think you release package will be named like `v1.zip`, `v2.zip`. You should make some changes in this script if your package name does not follow the convention.



The script `bc_auto.txt` is a simple script supported by Beyond compare. You should read some doc from [here](https://www.scootersoftware.com/v4help/index.html?sample_scripts.html) to customize it.