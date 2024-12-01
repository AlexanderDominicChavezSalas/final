import express from 'express';
import sensorsController from '../controllers/sensors.controller.js';
const router = express.Router();

router
    .get('/all', sensorsController.get)
    .get('/co', sensorsController.getCo)
    .get('/humidity', sensorsController.getHumidity)
    .get('/lpg', sensorsController.getLPG)
    .get('/smoke', sensorsController.getSmoke)
    .get('/temp', sensorsController.getTemp)
    .post('/', sensorsController.create)
    .put('/:id', sensorsController.update)
    .delete('/:id', sensorsController._delete);

export default router;