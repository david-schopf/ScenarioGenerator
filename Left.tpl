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
		 Position = (EI101,%1050%,5);		
		 Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 22, 22, 3,-3)};
		 Flowpoints =	
		 {				
			 (EI101, %0%,5,SimCar,Activate)
			 ,(EI101, %5000%, 5, SimCar, Deactivate)
			 
		 };
	  };	
	  
	  /* Passive Vehicle */
	  VehicleX PassXYZ0%SNR%
	  {
		 Vehicle = Car;	
		 UserID = %SNR%2;
		 Position = (EI101,%300%,4);		
		 Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 25, 25, 3,-3)};
		 Flowpoints =	
		 {				
			 (EI101, %0%,5,SimCar,Activate) 
			 ,(EI101, %5000%, 5, SimCar, Deactivate)
		 };
	  };
	  
	  /* Cooperation Partner */
	  VehicleX CoopXYZ0%SNR%
	  {
		 Vehicle = Car;	
		 UserID = %SNR%3;
		 Position = (EI101, %450%,5);		
		 Behaviour = {(LaneChangeAvoidance, 1, 1, 6),(CommandAction, 1, TRFC_CHANGELANEREQUEST, 4, 1, 100),(HazardAvoidance,0.5,0),(FreeDriving, 25, 25, 3,-3)};	
		 Flowpoints =	
		 {				
			 (EI101, %0%,4,SimCar, Activate) #Edit Offset Here
			 ,(EI101, %300%,4,SimCar, ActivateCommandAction,1)
			 ,(EI101, %400%,4,SimCar, UserChannel,%SNR%,3000)
			 ,(EI101, %3000%,4,SimCar, DeactivateCommandAction,1)
			 ,(EI101, %5000%, 4, SimCar, Deactivate)
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
			 (EI101, %0%, 4, SimCar,ActivateSource,(PassiveVehiclesXYZ0%SNR%))	
			 ,(EI101, %0%, 4, SimCar, ActivateDrain,(PassiveVehiclesXYZ0%SNR%))	
			 ,(EI101, %500%, 4, SimCar, DeactivateSource, (PassiveVehiclesXYZ0%SNR%))	
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
			 (EI101, %300%, 4, SimCar,ActivateSource,(FollowingVehiclesXYZ0%SNR%))	 
			 ,(EI101, %300%, 4, SimCar, ActivateDrain,(FollowingVehiclesXYZ0%SNR%))	 
			 ,(EI101, %800%, 4, SimCar, DeactivateSource, (FollowingVehiclesXYZ0%SNR%))	
		 };
	  };	  /*
	  ***********************************************************
	  *                   Flowpoints
	  ***********************************************************
	  */
	  Flowpoints = 
	  {
			(EI101, %750%, 4, Traffic, AutoBrakeLightControl, 0)
			,(EI101, %750%, 4, Traffic, AutoIndicatorLightControl, 1)
			,(EI101, %750%, 4, Traffic, Brakelight, 0)
			,(EI101, %750%, 5, Traffic, AutoBrakeLightControl, 0)
			,(EI101, %750%, 5, Traffic, AutoIndicatorLightControl, 1)
			,(EI101, %750%, 5, Traffic, Brakelight, 0)
			,(EI101, %810%, 4, Traffic, TargetSpeed, 36.11) 
			,(EI101, %1250%, 5, TrafficUserID, %SNR%3, TargetSpeed, 33.33)
			,(EI101, %2200%, 4, TrafficUserID, %SNR%3, TargetSpeed, 36.11) 
			,(EI101, %2250%, 4, TrafficUserID, %SNR%3, TargetSpeed, 36.11)
			,(EI101, %2300%, 4, TrafficUserID, %SNR%3, TargetSpeed, 36.11)
			,(EI101, %2350%, 4, TrafficUserID, %SNR%3, TargetSpeed, 36.11) 
			,(EI101, %2400%, 4, TrafficUserID, %SNR%3, TargetSpeed, 36.11) 
			,(EI101, %2900%, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
			,(EI101, %3300%, 4, Traffic, TargetSpeed, 28) 
			,(EI101, %3200%, 4, Traffic, ChangeLaneRequest, 5, 100, 0) 
			,(EI101, %3400%, 5, Traffic, TargetSpeed, 22) 
			 
	  };
};