import express from 'express';
import mongoose from 'mongoose';
import { errorHandler } from './general/middleware/errorHandler';
import routes from './general/routes';

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Routes
app.use('/api', routes);

// Error Handler
app.use(errorHandler);

// MongoDB connection
mongoose.connect('mongodb://localhost:27017/your_database')
  .then(() => console.log('Connected to MongoDB'))
  .catch((error: Error) => console.error('MongoDB connection error:', error));

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
}); 