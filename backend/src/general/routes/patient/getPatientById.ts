import express from 'express';
import { PatientController } from '../../controllers/patientController';

const router = express.Router();

router.get('/:id', PatientController.getPatientById);

export default router; 