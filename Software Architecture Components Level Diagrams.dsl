workspace {

    model {
        buyer = person "Buyer" "Person who wants to acquire daily consumption products" 
        seller = person "Seller" "Owner of an stablishment selling of daily consumer products" 
        payment = softwaresystem "System of payment" "Pay by credit card, debit card or cash" "Existing System"
        
        Compraloya = softwareSystem "Compralo ya!" "Application that compares prices between products of basic food basket" {
        
            mobileapp = container "Mobile App" "Provide some mobile functionalities to customers" "Kotlin" "Mobile App"
            database = container "Database" "Collection of information of consumption of user, stadististics and more data" "PostgreSQL Database Schema" "Database"
            apiapp = container "API App" "Program interface that provides Internet functionality via JSON/HTTPS API." "Java" {
            
                signincontroller = component "Sign in Controller" "Allow user to enter to Compralo ya!" "Java"
                datacomponent = component "Data Component" "Provide functionality to sign in or reset password" "Java"
                resetpasswordcontroller = component "Reset Password Controller" "Allow user to reset their passwords" "Java"
                paymentcomponent = component "Payment Component" "Make payments" "Java"
                searchcontroller = component "Search Controller" "Search stablishments selling and prices of products" "Java"
                locationcomponent = component "Location Component" "Provide the closest location of stablishments selling" "Java"
                promotionoffercontroller = component "Promotion - Offer Controller" "Show daily promotions and offers " "Java"
                productcomponent = component "Product Component" "Information of available products""Java"
                shoppingcartcontroller = component "Shopping Cart Controller" "Show prices of available products""Java"
                productclassificationcontroller = component "Product Classification Controller" "Classify products by categories""Java"
                
            }

        }
        
        #relationships - software system
        buyer -> Compraloya "Buy products and make payments"
        seller -> Compraloya "Sell products and receive payments"
        Compraloya -> payment "Process payments"
        
        #relationships - container
        buyer -> mobileapp "View products information, buy products and make payments" 
        seller -> mobileapp "View products information, sell products and receive payments"
        mobileapp -> apiapp "Makes API calls to" "JSON/HTTPS"
        apiapp -> database "Read from and write to" "JDBC"
        apiapp -> payment "Process payments"
        
        #relationships - component
        mobileapp -> signincontroller "Makes API calls to" "JSON/HTTPS"
        mobileapp -> resetpasswordcontroller "Makes API calls to" "JSON/HTTPS"
        mobileapp -> promotionoffercontroller "Makes API calls to" "JSON/HTTPS"
        mobileapp -> searchcontroller "Makes API calls to" "JSON/HTTPS"
        mobileapp -> shoppingcartcontroller "Makes API calls to" "JSON/HTTPS"
        signincontroller -> datacomponent "Uses" 
        resetpasswordcontroller -> datacomponent "Uses" 
        resetpasswordcontroller -> paymentcomponent "Uses" 
        searchcontroller -> locationcomponent "Uses"
        datacomponent -> database "Read from and write to" "JDBC"
        paymentcomponent -> payment "Process payments"
        locationcomponent -> database "Read from and write to" "JDBC"
        productcomponent -> database "Read from and write to" "JDBC"
        promotionoffercontroller -> locationcomponent "Uses"
        shoppingcartcontroller -> productcomponent "Uses"
        productclassificationcontroller -> productcomponent "Uses"
        
    }


    views {
        systemContext Compraloya "SystemContext" {
            include *
            animation {
                Compraloya
                buyer
                seller
                payment
            }
            autolayout lr
        }

        container Compraloya "Container" {
            include *
            animation {
                buyer
                seller
                mobileapp
                apiapp
                database
            
        }
            autolayout lr
        }
        
        component apiapp "Component" {
            include *
            animation {
                signincontroller
                resetpasswordcontroller
                datacomponent
                paymentcomponent
                database
                payment
        }
            autolayout 
        }

        
        theme default
        
        styles {
         element "Existing System" {
                background #999999
                color #ffffff
            }
            
        element "Mobile App" {
            shape MobileDevicePortrait
        }
        
        element "Database" {
            shape Cylinder
        }
        
        }
    }

}

