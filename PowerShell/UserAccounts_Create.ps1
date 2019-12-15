###
### These are vairable you need to update to reflect your environment
###

# Login account.  This account will create the users
$Admin = "Bob@scottmillers9662outlook.onmicrosoft.com"
$AdminPassword = "Pa55w.rd1234"

$NewUserPassword = "Pa55w.rd1234"
$CsvFilePath = "C:\Users\scott\OneDrive\Development\Azure Security Technologies\AZ-500\users.csv"


$Directory = "scottmillers9662outlook.onmicrosoft.com"


try {

    ###
    ### Create a PowerShell connection to my directory. If you do not want to specify the password in the script, you can simply replace this with "Connect-AzureAD", which will prompt for a username and password.
    ###

    $SecPass = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PSCredential ($Admin, $SecPass)
    Connect-AzureAD -Credential $cred



    # $SecPass = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
    # $Cred = New-Object System.Management.Automation.PSCredential($ServicePrincipleID, $SecPass)
    # Connect-AzAccount -ServicePrincipal -Credential $Cred -TenantId $Directory -Confirm


    $tenant = Get-AzureADTenantDetail 
    Write-Host("Tenant ID is " + $tenant)

    # GEt the password
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $NewUserPassword

    ###
    ### Import the csv file. You will need to specify the path and file name of the CSV file in this cmdlet
    ###

    $NewUsers = import-csv -Path $CsvFilePath

    ###
    ### Loop through all new users in the file. We'll use the ForEach cmdlet for this.
    ###

    Foreach ($NewUser in $NewUsers) { 

        ###
        ### Construct the UserPrincipalName, the MailNickName and the DisplayName from the input data in the file 
        ###

        $UPN = $NewUser.Firstname + "." + $NewUser.LastName + "@" + $Directory
        $DisplayName = $NewUser.Firstname + " " + $NewUser.Lastname + " (" + $NewUser.Department + ")"
        $MailNickName = $NewUser.Firstname + "." + $NewUser.LastName

        ###
        ### Now that we have all the necessary data for to create the new user, we can execute the New-AzureADUser cmdlet  
        ###

        New-AzureADUser -UserPrincipalName $UPN -AccountEnabled $true -DisplayName $DisplayName -GivenName $NewUser.FirstName -MailNickName $MailNickName -Surname $NewUser.LastName -Department $Newuser.Department -JobTitle $NewUser.JobTitle -PasswordProfile $PasswordProfile

        ###
        ### End the Foreach loop
        ###
    }

}
catch {

    Write-Host $_
  
}
finally {
    Disconnect-AzureAD
}


