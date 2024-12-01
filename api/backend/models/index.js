import { Sensor, SensorSchema } from './sensors.model.js';



function setupModels(sequelize) {
    Sensor.init(SensorSchema, Sensor.config(sequelize));
    
}

export default setupModels;
