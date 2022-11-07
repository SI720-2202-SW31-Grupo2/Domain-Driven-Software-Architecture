workspace {
    model {
        buyer = person "Buyer" "Person who wants to acquire daily consumption products" 
        seller = person "Seller" "Owner of an stablishment selling of daily consumer products" 
        payment = softwaresystem "System of payment" "Pay by credit card, debit card or cash" "Existing System"
        Compraloya = softwareSystem "Compralo ya!" "Application that compares prices between products of basic food basket" {
            mobileapp = container "Mobile App" "Provide some mobile functionalities to customers" "Kotlin" "Mobile App"
            apiapp = container "API App" "Program interface that provides Internet functionality via JSON/HTTPS API." "Java"
            database = container "Database" "Collection of information of consumption of user, stadististics and more data" "PostgreSQL Database Schema" "Database"
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
