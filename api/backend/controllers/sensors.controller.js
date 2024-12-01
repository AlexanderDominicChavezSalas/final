import SensorsService from '../services/sensors.service.js';
const service = new SensorsService();

const create = async (req, res) => {
    try {
        console.log("controlador", req.body);
        const response = await service.create(req.body);
        
        res.json({ success: true, data: response });
    } catch (error) {
        res.status(500).send({ success: false, message: error.message });
    }
};
const get = async (req,res) => {
    try{
        const response = await service.find();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getCo = async (req,res) => {
    try{
        const response = await service.findCo();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getHumidity = async (req,res) => {
    try{
        const response = await service.findHumidity();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getLPG = async (req,res) => {
    try{
        const response = await service.findLPG();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getSmoke = async (req,res) => {
    try{
        const response = await service.findSmoke();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getTemp = async (req,res) => {
    try{
        const response = await service.findTemp();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}

const update = async (req,res) => {
    try{
        const { id }=req.params;
        const body = req.body;
        const response = await service.update(id,body);
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const _delete = async (req,res) => {
    try{
        const { id }=req.params;
        const response = await service.delete(id);
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
export default {
    create,get,getCo,getHumidity,getLPG,getSmoke,getTemp,update,_delete
};