Traffic SituationXYZ0%SNR%	
{
	  /*
	  ***********************************************************
	  *             Cooperation %SNR% - LEFT %ANZAHL% FOLLOWING
	  ***********************************************************
	  */
	  
	  /* Obstacle */
	  VehicleX ObstXYZ0%SNR%
	  {
		 Vehicle = LKW;	
		 UserID = %SNR%1;
		 Position = (%MODUL%,%1050%,5);		
		 Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 22, 22, 3,-3)};
		 Flowpoints =	
		 {				
			 (%MODUL%, %0%,5,SimCar,Activate)
			 ,(%MODUL%, %5000%, 5, SimCar, Deactivate)
			 
		 };
	  };	
	  
	  /* Passive Vehicle */
	  VehicleX PassXYZ0%SNR%
	  {
		 Vehicle = Car;	
		 UserID = %SNR%2;
		 Position = (%MODUL%,%300%,4);		
		 Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 25, 25, 3,-3)};
		 Flowpoints =	
		 {				
			 (%MODUL%, %0%,5,SimCar,Activate) 
			,(%MODUL%, %2700%, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
			,(%MODUL%, %2700%, 4, Traffic, TargetSpeed, 28) 
			 ,(%MODUL%, %5000%, 5, SimCar, Deactivate)
		 };
	  };
	  
	  /* Cooperation Partner */
	  VehicleX CoopXYZ0%SNR%
	  {
		 Vehicle = Car;	
		 UserID = %SNR%3;
		 Position = (%MODUL%, %450%,5);		
		 Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(CommandAction, 1, TRFC_CHANGELANEREQUEST, 4, 1, 100),(FreeDriving, 36, 36, 3,-3)};	
		 Flowpoints =	
		 {				
			 (%MODUL%, %0%,4,SimCar, Activate) #Edit Offset Here
            ,(%MODUL%, %460%, 5, Traffic, TargetSpeed, 24)
			 ,(%MODUL%, %300%,4,SimCar, ActivateCommandAction,1)
			 ,(%MODUL%, %400%,4,SimCar, UserChannel,%SNR%,3000)
            ,(%MODUL%, %1250%, 5, Traffic, TargetSpeed, 33.33)
            ,(%MODUL%, %2050%, 4, Traffic, TargetSpeed, 36.11)
            ,(%MODUL%, %2100%, 4, Traffic, TargetSpeed, 36.11)
            ,(%MODUL%, %2150%, 4, Traffic, TargetSpeed, 36.11)
            ,(%MODUL%, %2200%, 4, Traffic, TargetSpeed, 36.11) 
            ,(%MODUL%, %2250%, 4, Traffic, TargetSpeed, 36.11)
            ,(%MODUL%, %2300%, 4, Traffic, TargetSpeed, 36.11)
            ,(%MODUL%, %2350%, 4, Traffic, TargetSpeed, 36.11) 
            ,(%MODUL%, %2400%, 4, Traffic, TargetSpeed, 36.11) 
			 ,(%MODUL%, %3000%,4,SimCar, DeactivateCommandAction,1)
			,(%MODUL%, %2700%, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
			,(%MODUL%, %2700%, 4, Traffic, TargetSpeed, 28) 
			 ,(%MODUL%, %5000%, 4, SimCar, Deactivate)
		 };
	  };
	  
	  /* Following Vehicles behind the Cooperation Vehicle */
	  TrafficFlow PassiveVehiclesXYZ0%SNR%
	  {
		 Source PassiveVehiclesXYZ0%SNR%
		 {
			 Position = (SimCar, 270, 5);
			 Vehicles = 
			 {
				 (3, PKW, (HazardAvoidance,1,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 28, 28, 3,-1))  #Edit Number of Following Vehicles here
			 };
			 Parameters = (Gleich,6,6,1,1000); #Zufallsparameter zur Verteilung der Fahrzeuge
		 };
			 
		 Drain PassiveVehiclesXYZ0%SNR%	
		 {
			 Position = (SimCar, 500, 5);
		 };
			 
		 Flowpoints = 
		 {
			 (%MODUL%, %0%, 4, SimCar,ActivateSource,(PassiveVehiclesXYZ0%SNR%))	
			 ,(%MODUL%, %0%, 4, SimCar, ActivateDrain,(PassiveVehiclesXYZ0%SNR%))	
			 ,(%MODUL%, %500%, 4, SimCar, DeactivateSource, (PassiveVehiclesXYZ0%SNR%))	
		 };
	  };
	  
	  /* Passive Vehicles behing the Ego Vehicle */
	  TrafficFlow FollowingVehiclesXYZ0%SNR%
	  {
		 Source FollowingVehiclesXYZ0%SNR%
		 {
			 Position = (SimCar, -250, 4);
			 Vehicles = 
			 {
				 (3, PKW, (HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 50, 50, 3,-3))  
			 };
			 Parameters = (Gleich,6,6,1,1000); #Zufallsparameter zur Verteilung der Fahrzeuge
		 };
			 
		 Drain FollowingVehiclesXYZ0%SNR%	
		 {
			 Position = (SimCar, 500, 5);
		 };
			 
		 Flowpoints = 
		 {
			 (%MODUL%, %300%, 4, SimCar,ActivateSource,(FollowingVehiclesXYZ0%SNR%))	 
			 ,(%MODUL%, %300%, 4, SimCar, ActivateDrain,(FollowingVehiclesXYZ0%SNR%))	 
			 ,(%MODUL%, %800%, 4, SimCar, DeactivateSource, (FollowingVehiclesXYZ0%SNR%))	
		 };
	  };	  /*
	  ***********************************************************
	  *                   Flowpoints
	  ***********************************************************
	  */
	  Flowpoints = 
	  {
			(%MODUL%, %750%, 4, Traffic, AutoBrakeLightControl, 0)
			,(%MODUL%, %750%, 4, Traffic, AutoIndicatorLightControl, 1)
			,(%MODUL%, %750%, 4, Traffic, Brakelight, 0)
			,(%MODUL%, %750%, 5, Traffic, AutoBrakeLightControl, 0)
			,(%MODUL%, %750%, 5, Traffic, AutoIndicatorLightControl, 1)
			,(%MODUL%, %750%, 5, Traffic, Brakelight, 0)
            ,(%MODUL%, %810%, 4, Traffic, TargetSpeed, 36.11) 
			,(%MODUL%, %2900%, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
			,(%MODUL%, %2900%, 4, Traffic, TargetSpeed, 28) 
			,(%MODUL%, %3100%, 4, Traffic, ChangeLaneRequest, 5, 100, 0) 
			,(%MODUL%, %3100%, 4, Traffic, TargetSpeed, 22) 
			,(%MODUL%, %3000%, 5, Traffic, TargetSpeed, 22) 
			 
	  };
};