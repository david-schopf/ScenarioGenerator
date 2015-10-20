
Traffic SituationXYZ0%SNR%
{
/*
***********************************************************
*            Cooperation %SNR% - RIGHT %ANZAHL% FOLLOWING
***********************************************************
*/

/* Obstacle */
VehicleX ObstXYZ0%SNR%
{
Vehicle = MAN_TGX_orange22;
UserID = %SNR%1;
Position = (EI101,900,5);
Behaviour = {(HazardAvoidance,0.5,0,3,6),(LaneChangeAvoidance, 1, 1, 6),(SimCarLocked,900),(FreeDriving, 22, 22, 3,-3)};
Flowpoints =
{
(EI101,0,5,SimCar,Activate)
,(EI101,300,5,SimCar,Unlock)
,(EI101,5000,5,SimCar,Deactivate)

};
};

/* Passive Vehicle */
VehicleX PassXYZ0%SNR%
{
Vehicle = Camaro_blau;
UserID = %SNR%2;
Position = (EI101,0,4);
Behaviour = {(HazardAvoidance,0.5,0,3,6),(LaneChangeAvoidance, 1, 1, 6),(SimCarLocked,-350),(FreeDriving, 50, 50, 3,-3)};
Flowpoints =
{
(EI101, 0, 5, SimCar, Activate)
,(EI101, 300, 5, SimCar, Unlock)
,(EI101, 2800, 4, SimCarUserID, %SNR%2, ChangeLaneRequest, 5, 100, 0)
,(EI101, 2900, 4, SimCarUserID, %SNR%2, TargetSpeed, 30)
,(EI101, 5000, 4, SimCar, Deactivate)
};
};

/* Cooperation Partner */
VehicleX CoopXYZ0%SNR%
{
Vehicle = VWBus_blue;
UserID = %SNR%3;
Position = (EI101,0,4);
Behaviour = {(HazardAvoidance,0.5,0,3,6),(LaneChangeAvoidance, 1, 1, 6),(SimCarLocked,-400),(FreeDriving, 50, 50, 3,-3)};
Flowpoints =
{
(EI101,0,5,SimCar,Activate)
,(EI101,300,5,SimCar,Unlock)
,(ExternalEvent, %SNR%, HazardAvoidance, 1.5, 0, 3, 6)
,(EI101,2160,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2180,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2200,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2220,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2240,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2260,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2280,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2300,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2320,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2340,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2360,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2380,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2400,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2420,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101,2440,4,SimCarUserID,%SNR%3,HazardAvoidance,0.5,0)
,(EI101, 3100, 4, SimCarUserID, %SNR%3, ChangeLaneRequest, 5, 100, 0)
,(EI101, 3100, 4, SimCarUserID, %SNR%3, TargetSpeed, 30)
,(EI101, 5000, 4, SimCar, Deactivate)
};
};


/* Passive Vehicles in Front of Cooperation Vehicle */
TrafficFlow PassiveVehiclesXYZ0%SNR%
{
Source PassiveVehiclesXYZ%SNR%
{
Position = (SimCar, -250, 4);
Vehicles =
{
(2, PKW, (HazardAvoidance,0.5,0,3,6),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 50, 50, 3,-3))  #Edit Number of Passive Vehicles here
};
Parameters = (Gleich,3,3,1,1000); #Zufallsparameter zur Verteilung der Fahrzeuge
};

Drain PassiveVehiclesXYZ0%SNR%
{
Position = (SimCar, 500, 5);
};

Flowpoints =
{
(EI101, 300, 4, SimCar,ActivateSource,(PassiveVehiclesXYZ0%SNR%))
,(EI101, 300, 4, SimCar, ActivateDrain,(PassiveVehiclesXYZ0%SNR%))
,(EI101, 500, 4, SimCar, DeactivateSource, (PassiveVehiclesXYZ0%SNR%))
};
};

/* Following Vehicles behind the Cooperation Vehicle */
TrafficFlow FollowingVehiclesXYZ0%SNR%
{
Source FollowingVehiclesXYZ0%SNR%
{
Position = (SimCar, -450, 4);
Vehicles =
{
(%ANZAHL%, PKW, (HazardAvoidance,0.5,0,3,6),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 50, 50, 3,-1))  #Edit Number of Following Vehicles here
};
Parameters = (Gleich,3,3,1,1000);
};

Drain FollowingVehiclesXYZ0%SNR%
{
Position = (SimCar, 500, 5);
};

Flowpoints =
{
(EI101, 300, 4, SimCar,ActivateSource,(FollowingVehiclesXYZ0%SNR%))
,(EI101, 300, 4, SimCar, ActivateDrain,(FollowingVehiclesXYZ0%SNR%))
,(EI101, 800, 4, SimCar, DeactivateSource, (FollowingVehiclesXYZ0%SNR%))
};
};

/*
***********************************************************
*                   Flowpoints
***********************************************************
*/
Flowpoints =
{
(EI101, 500, 4, Traffic, AutoBrakeLightControl, 0)
,(EI101, 500, 4, Traffic, AutoIndicatorLightControl, 1)
,(EI101, 500, 4, Traffic, Brakelight, 0)
,(EI101, 900, 4, Traffic, TargetSpeed, 43)
,(EI101, 1200, 4, Traffic, TargetSpeed, 36.11)
,(EI101, 3000, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
,(EI101, 3200, 5, Traffic, TargetSpeed, 30)
,(EI101, 3100, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
,(EI101, 3300, 5, Traffic, TargetSpeed, 22)

# Pro Fahrzeug 100 m drauf (bei 4: 200 m)

};

};