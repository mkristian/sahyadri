Ixtlan::Guard.initialize(:books, 
                 { :index => ['books','teachers', 'students', 'office'], 
                   :show => ['books','teachers', 'students', 'office'], 
                   :edit => ['books'], 
                   :update => ['books'], 
                   :new => ['books'], 
                   :create => ['books'], 
                   :destroy => [] })
