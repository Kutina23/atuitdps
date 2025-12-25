import { PrismaClient, UserRole } from '@prisma/client';
import * as bcrypt from 'bcrypt';

const prisma = new PrismaClient();

async function createAdmin() {
  const adminData = {
    name: 'Admin User',
    email: 'admin@example.com',
    password: await bcrypt.hash('admin123', 10), // You should change this password
    role: UserRole.admin,
    status: 'active'
  };

  try {
    const admin = await prisma.user.upsert({
      where: { email: adminData.email },
      update: {},
      create: adminData,
    });
    
    console.log('Admin user created/updated successfully:', {
      id: admin.id,
      email: admin.email,
      role: admin.role
    });
  } catch (error) {
    console.error('Error creating admin user:', error);
  } finally {
    await prisma.$disconnect();
  }
}

createAdmin();
