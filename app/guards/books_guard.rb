Ixtlan::Guard.initialize(:books, 
                 { :index => ['books','teacher'], 
                   :show => ['books','teacher'], 
                   :edit => ['books'], 
                   :update => ['books'], 
                   :new => ['books'], 
                   :create => ['books'], 
                   :destroy => [] })
