import { models } from '../libs/sequelize.js';

class SensorsService{
    constructor(){}
    async find() {
        const res = await models.Sensor.findAll();
        return res;
    }
    async findCo() {
        const res = await models.Sensor.findAll({
            attributes: ['id', 'ts', 'co'] // Especifica los campos que quieres obtener
        });
        return res;
    }
    async findHumidity() {
        const res = await models.Sensor.findAll({
            attributes: ['id', 'ts', 'humidity'] // Especifica los campos que quieres obtener
        });
        return res;
    }
    async findLPG() {
        const res = await models.Sensor.findAll({
            attributes: ['id', 'ts', 'lpg'] // Especifica los campos que quieres obtener
        });
        return res;
    }
    async findSmoke() {
        const res = await models.Sensor.findAll({
            attributes: ['id', 'ts', 'smoke'] // Especifica los campos que quieres obtener
        });
        return res;
    }
    async findTemp() {
        const res = await models.Sensor.findAll({
            attributes: ['id', 'ts', 'temp'] // Especifica los campos que quieres obtener
        });
        return res;
    }
    async create(data) {
        console.log("service", data);
        const res = await models.Sensor.create(data);
        return res;
    }
    async update(id, data) {
        const model = await models.Sensor.findByPk(id);
        if (!model) {
            return null;
        }
        const res = await model.update(data);
        return res;
        
    }
    async delete(id){
        const model = await models.Sensor.findByPk(id);
        await model.destroy();
        return { deleted: true };
    }
}

export default SensorsService;