import express from 'express';
import { PatientController } from '../../controllers/patientController';

const router = express.Router();

router.delete('/:id', PatientController.deletePatient);

export default router; 