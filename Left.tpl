Traffic SituationXYZ02
{
/*
***********************************************************
*             Cooperation 2 - LEFT 3 FOLLOWING
***********************************************************
*/

/* Obstacle */
VehicleX ObstXYZ02
{
Vehicle = MAN_TGX_orange22;
UserID = 21;
Position = (EI101,5050,5);
Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 22, 22, 3,-3)};	#Verhaltensmodelle nach Priorit�t geordnet: HazardAvoidance ist zur Kollisionsvermeidung (Minimaler Abstand in s, Abstand in m), FreeDriving f�r normales Fahren (Startgeschwindigkeit in m/s, Zielgeschwindigkeit)
Flowpoints =
{
(EI101,4000,5,SimCar,Activate)
,(EI101, 9000, 5, SimCar, Deactivate)

};
};

/* Passive Vehicle */
VehicleX PassXYZ02
{
Vehicle = Camaro_blau;
UserID = 22;
Position = (EI101,4300,4);
Behaviour = {(HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 25, 25, 3,-3)};	#Verhaltensmodelle nach Priorit�t geordnet: HazardAvoidance(Minimaler Abstand in s, Abstand in m), FreeDriving f�r normales Fahren (Startgeschwindigkeit in m/s, Zielgeschwindigkeit)
Flowpoints =
{
(EI101,4000,5,SimCar,Activate) #Edit Offset Here
,(EI101, 9000, 5, SimCar, Deactivate)
};
};

/* Cooperation Partner */
VehicleX CoopXYZ02
{
Vehicle = VWBus_blue;
UserID = 23;
Position = (EI101,4450,5);
Behaviour = {(LaneChangeAvoidance, 1, 1, 6),(CommandAction, 1, TRFC_CHANGELANEREQUEST, 4, 1, 100),(HazardAvoidance,0.5,0),(FreeDriving, 25, 25, 3,-3)};	#Verhaltensmodelle nach Priorit�t geordnet: HazardAvoidance(Minimaler Abstand in s, Abstand in m), FreeDriving f�r normales Fahren (Startgeschwindigkeit in m/s, Zielgeschwindigkeit)
Flowpoints =
{
(EI101,4000,4,SimCar, Activate) #Edit Offset Here
,(EI101,4300,4,SimCar, ActivateCommandAction,1)
,(EI101,4400,4,SimCar, UserChannel,2,3000)
,(EI101,7000,4,SimCar, DeactivateCommandAction,1)
,(EI101, 9000, 4, SimCar, Deactivate)
};
};

/* Following Vehicles behind the Cooperation Vehicle */
TrafficFlow PassiveVehiclesXYZ02
{
Source PassiveVehiclesXYZ02
{
Position = (SimCar, 270, 5);
Vehicles =
{
(3, PKW, (HazardAvoidance,1,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 28, 28, 3,-1))  #Edit Number of Following Vehicles here
};
Parameters = (Gleich,6,6,1,1000); #Zufallsparameter zur Verteilung der Fahrzeuge
};

Drain PassiveVehiclesXYZ02
{
Position = (SimCar, 500, 5);
};

Flowpoints =
{
(EI101, 4000, 4, SimCar,ActivateSource,(PassiveVehiclesXYZ02))	#Edit Offset Here
,(EI101, 4000, 4, SimCar, ActivateDrain,(PassiveVehiclesXYZ02))	#Edit Offset Here
,(EI101, 4500, 4, SimCar, DeactivateSource, (PassiveVehiclesXYZ02))	#Edit Offset Here
};
};

/* Passive Vehicles behing the Ego Vehicle */
TrafficFlow FollowingVehiclesXYZ02
{
Source FollowingVehiclesXYZ02
{
Position = (SimCar, -250, 4);
Vehicles =
{
(3, PKW, (HazardAvoidance,0.5,0),(LaneChangeAvoidance, 1, 1, 6),(FreeDriving, 50, 50, 3,-3))
};
Parameters = (Gleich,6,6,1,1000); #Zufallsparameter zur Verteilung der Fahrzeuge
};

Drain FollowingVehiclesXYZ02
{
Position = (SimCar, 500, 5);
};

Flowpoints =
{
(EI101, 4300, 4, SimCar,ActivateSource,(FollowingVehiclesXYZ02))
,(EI101, 4300, 4, SimCar, ActivateDrain,(FollowingVehiclesXYZ02))
,(EI101, 4800, 4, SimCar, DeactivateSource, (FollowingVehiclesXYZ02))
};
};	  /*
***********************************************************
*                   Flowpoints
***********************************************************
*/
Flowpoints =
{
(EI101, 4750, 4, Traffic, AutoBrakeLightControl, 0)
,(EI101, 4750, 4, Traffic, AutoIndicatorLightControl, 1)
,(EI101, 4750, 4, Traffic, Brakelight, 0)
,(EI101, 4750, 5, Traffic, AutoBrakeLightControl, 0)
,(EI101, 4750, 5, Traffic, AutoIndicatorLightControl, 1)
,(EI101, 4750, 5, Traffic, Brakelight, 0)
,(EI101, 4810, 4, Traffic, TargetSpeed, 36.11)
,(EI101, 5250, 5, TrafficUserID, 23, TargetSpeed, 33.33)
,(EI101, 6100, 4, TrafficUserID, 23, TargetSpeed, 36.11)
,(EI101, 7100, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
,(EI101, 7300, 4, Traffic, TargetSpeed, 28)
,(EI101, 7200, 4, Traffic, ChangeLaneRequest, 5, 100, 0)
,(EI101, 7400, 5, Traffic, TargetSpeed, 22)

};
};