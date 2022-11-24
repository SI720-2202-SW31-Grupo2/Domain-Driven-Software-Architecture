workspace {

    model {
        buyer = person "Buyer" "Person who wants to acquire daily consumption products" 
        seller = person "Seller" "Owner of an stablishment selling of daily consumer products" 
        payment = softwaresystem "System of payment" "Pay by credit card, debit card or cash" "Existing System"
        
        Compraloya = softwareSystem "Compralo ya!" "Application that compares prices between products of basic food basket" {
        
            mobileapp = container "Mobile App" "Provide some mobile functionalities to customers" "Kotlin" "Mobile App"
            database = container "Database" "Collection of information of consumption of user, stadististics and more data" "PostgreSQL Database Schema" "Database"
            locationbc = container "Location Bounded Context" "Bounded Context of stablishments selling location" "Java" "Bounded Context"
            promotionbc = container "Promotions Bounded Context" "Bounded Context of promotions" "Java" "Bounded Context"
            offerbc = container "Offers Bounded Context" "Bounded Context of offers" "Java" "Bounded Context"
            reportbc = container "Reports Bounded Context" "Bounded Context of report process" "Java" "Bounded Context"
            orderbc = container "Order Process Bounded Context" "Bounded Context of order process" "Java" "Bounded Context"
            paymentbc = container "Payment Bounded Context" "Bounded Context of payment process" "Java" "Bounded Context"
            shoppingbc = container "Shopping List Bounded Context" "Bounded Context of shopping list" "Java" "Bounded Context"
            apiapp = container "API App" "Program interface that provides Internet functionality via JSON/HTTPS API." "Java" {
            
                ownerclass = component "Owner Class" "Provide information of seller" "Java"
                businessclass = component "Business Class" "Provide information of business" "Java"
                buyerclass = component "Buyer Class" "Provide information of buyer" "Java"
                paymentclass = component "Payment Method Class" "Make payments" "Java"
                orderclass = component "Order Class" "Provide buyer order information" "Java"
                locationclass = component "Location Class" "Provide the closest location of stablishments selling" "Java"
                promotionofferclass = component "Promotion - Offer Class" "Show daily promotions and offers " "Java"
                productclass = component "Product Class" "Information of available products""Java"
                shoppinglistclass = component "Shopping List Class" "Show prices of available products""Java"
               
                
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
        apiapp -> locationbc "Makes API calls to" "JSON/HTTPS"
        apiapp -> promotionbc "Makes API calls to" "JSON/HTTPS"
        apiapp -> offerbc "Makes API calls to" "JSON/HTTPS"
        apiapp -> reportbc "Makes API calls to" "JSON/HTTPS"
        apiapp ->  orderbc "Makes API calls to" "JSON/HTTPS"
        apiapp -> paymentbc "Makes API calls to" "JSON/HTTPS"
        apiapp -> shoppingbc "Makes API calls to" "JSON/HTTPS"
        locationbc  ->  database "Read from and write to" "JDBC"
        promotionbc ->  database "Read from and write to" "JDBC"
        offerbc ->  database "Read from and write to" "JDBC"
        reportbc ->  database "Read from and write to" "JDBC"
        orderbc  ->  database "Read from and write to" "JDBC"
        paymentbc -> database "Read from and write to" "JDBC"
        shoppingbc  -> database "Read from and write to" "JDBC"
        apiapp -> payment "Process payments"
        
        #relationships - component
        mobileapp -> ownerclass "Makes API calls to" "JSON/HTTPS"
        mobileapp -> buyerclass "Makes API calls to" "JSON/HTTPS"
        mobileapp -> promotionofferclass "Makes API calls to" "JSON/HTTPS"
        mobileapp -> locationclass "Makes API calls to" "JSON/HTTPS"
        mobileapp -> shoppinglistclass "Makes API calls to" "JSON/HTTPS"
        ownerclass -> businessclass "Uses" 
        buyerclass -> orderclass "Uses" 
        shoppinglistclass -> productclass "Uses" 
        locationclass -> productclass "Uses" 
        promotionofferclass -> paymentclass "Uses"
        businessclass -> database "Read from and write to" "JDBC"
        paymentclass -> payment "Process payments"
        productclass -> database "Read from and write to" "JDBC"
        orderclass -> database "Read from and write to" "JDBC"
    
        
        
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
                locationbc
                promotionbc
                offerbc
                reportbc
                orderbc  
                paymentbc 
                shoppingbc
                database
            
        }
            autolayout 
        }
        
        component apiapp "Component" {
            include *
            animation {
                ownerclass 
                businessclass
                buyerclass 
                paymentclass 
                orderclass 
                locationclass 
                promotionofferclass
                productclass 
                shoppinglistclass
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
        
        element "Bounded Context" {
            shape Hexagon
            background #7F3667
            color #ffffff
        }
        
        
        }
    }

}
