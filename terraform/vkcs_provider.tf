terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.5.2" 
        }
    }
}

provider "vkcs" {
    # Your user account.
    username = "nikitindm21@st.ithub.ru"

    # The password of the account
    password = "Dnik1811@1507"
    #api_key = "gAAAAABm6dZ3_B2Vh9M1yxsM5UZF3r2Ka60eqeRtmdL9mh2NJLbGE1vqukAmLD6m9Sr6XPWvx64tXaWtrlDj92cnBKDbforSp6xOmlCGx90VH9s7W0GZKQjNDJMYCkywVCBEotn7uKSBAYBawMZtM8FDbIuFHT1Da9LnYhSb5sSp-D_wI_oL3idqe5IUXYEO9LHtPbv6_tl2"
    # The tenant token can be taken from the project Settings tab - > API keys.
    # Project ID will be our token.
    project_id = "259eb7c6129a46f6b01062f53d57b9f8"
    
    # Region name
    region = "RegionOne"
    
    auth_url = "https://infra.mail.ru:35357/v3/" 
}
