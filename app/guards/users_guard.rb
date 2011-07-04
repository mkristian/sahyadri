Ixtlan::Guard.initialize(:users, 
                 { :index => [:users],
                   :show => [:users],
                   :edit => [:users],
                   :update => [:users],
                   :new => [:users],
                   :create => [:users],
	           :reset_password => [:users],
                   :destroy => [] })
		   
