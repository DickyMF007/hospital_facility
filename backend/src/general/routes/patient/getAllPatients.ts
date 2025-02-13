import express from 'express';
import { PatientController } from '../../controllers/patientController';

const router = express.Router();

router.get('/', PatientController.getAllPatients);

export default router; 