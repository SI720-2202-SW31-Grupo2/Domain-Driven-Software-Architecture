workspace {

    model {
        buyer = person "Buyer" "Person who wants to acquire daily consumption products" 
        seller = person "Seller" "Owner of an stablishment selling of daily consumer products" 
        payment = softwaresystem "System of payment" "Pay by credit card, debit card or cash" "Existing System"
        Compraloya = softwareSystem "Cómpralo ya!" "Application that compares prices between products of basic food basket" 
        #relationships
        buyer -> Compraloya "Uses"
        seller -> Compraloya "Uses"
        Compraloya -> payment "Pays with"
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
        theme default
        styles {
         element "Existing System" {
                background #999999
                color #ffffff
            }       
        }
    }
}

