/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Edited by bondz
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];

while{true} do
{
    _vehicleToFuel = (vehicle player);

    
    if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
    {
        _velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
        
        
        switch (typeOf (_vehicleToFuel)) do {
            case "B_Quadbike_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_Hatchback_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_Offroad_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_SUV_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_Van_01_transport_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_Hatchback_01_sport_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;}; 
            case "C_Van_01_box_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "I_Truck_02_transport_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "I_Truck_02_covered_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "B_Truck_01_transport_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "O_Truck_03_transport_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "O_Truck_03_covered_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "B_Truck_01_box_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "O_Truck_03_device_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "B_G_Offroad_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "O_MRAP_02_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "B_G_Offroad_01_armed_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "B_MRAP_01_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            case "I_MRAP_03_F":
            {_fuelConsumption = _velocityOfVehicle/100000+ 0.0001;};
            case "B_MRAP_01_hmg_F":
            {_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
            default {_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;}
        };
        
        if(_fuelConsumption > 0.002) then
        {
            _fuelConsumption = 0.002;
        };
        _vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
        
        //hint format["Benzinverbrauch: %1L/km",_fuelConsumption*10000/2];

        if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
        {
            hint "PIMP! Poca gasolina...";
        }
        else
        {
            if(fuel _vehicleToFuel < 0.03) then
            {
                hint "Buscate unas buenas zapatillas para andar...";
            };
        };
    };
    sleep 2;
};