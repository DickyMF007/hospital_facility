import { Schema, model } from 'mongoose';

interface IPatient {
  name: string;
  dateOfBirth: Date;
  gender: 'male' | 'female' | 'other';
  address: string;
  phoneNumber: string;
  medicalHistory?: string;
  createdAt: Date;
  updatedAt: Date;
}

const patientSchema = new Schema<IPatient>(
  {
    name: {
      type: String,
      required: true,
    },
    dateOfBirth: {
      type: Date,
      required: true,
    },
    gender: {
      type: String,
      enum: ['male', 'female', 'other'],
      required: true,
    },
    address: {
      type: String,
      required: true,
    },
    phoneNumber: {
      type: String,
      required: true,
    },
    medicalHistory: {
      type: String,
      required: false,
    },
  },
  {
    timestamps: true,
  }
);

export const Patient = model<IPatient>('Patient', patientSchema); 