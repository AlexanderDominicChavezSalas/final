import express from 'express';

import sensorsRouter from './sensor.route.js';


function routerApi (app){
    const router = express.Router();
    app.use('/api/v1',router); //ruta general de backend
    router.use('/sensors', sensorsRouter); //ruta para los sensores
}

export default routerApi;