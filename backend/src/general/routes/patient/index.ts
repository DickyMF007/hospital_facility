import express from 'express';
import createPatient from './createPatient';
import deletePatient from './deletePatient';
import getAllPatients from './getAllPatients';
import getPatientById from './getPatientById';
import updatePatient from './updatePatient';

const router = express.Router();

// Register all patient routes
router.post('/', createPatient);
router.get('/', getAllPatients);
router.get('/:id', getPatientById);
router.put('/:id', updatePatient);
router.delete('/:id', deletePatient);

export default router; 