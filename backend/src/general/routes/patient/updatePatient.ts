import express from 'express';
import { PatientController } from '../../controllers/patientController';

const router = express.Router();

router.put('/:id', PatientController.updatePatient);

export default router; 