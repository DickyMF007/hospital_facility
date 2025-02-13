import express from 'express';
import { PatientController } from '../../controllers/patientController';

const router = express.Router();

router.post('/', PatientController.createPatient);

export default router; 