const USERS_KEY = 'cine_users';

export const registerRequest = async (userData) => {
  const users = JSON.parse(localStorage.getItem(USERS_KEY)) || [];

  const userExists = users.find((user) => user.gmail === userData.gmail);

  if (userExists) {
    throw new Error('Ese gmail ya está registrado');
  }

  const newUser = {
    id_usuario: Date.now(),
    nombre: userData.nombre,
    apellido: userData.apellido,
    ciudad: userData.ciudad,
    gmail: userData.gmail,
    contrasena: userData.contrasena
  };

  users.push(newUser);

  localStorage.setItem(USERS_KEY, JSON.stringify(users));

  return {
    message: 'Usuario registrado correctamente',
    user: {
      id_usuario: newUser.id_usuario,
      nombre: newUser.nombre,
      apellido: newUser.apellido,
      ciudad: newUser.ciudad,
      gmail: newUser.gmail
    }
  };
};

export const loginRequest = async (loginData) => {
  const users = JSON.parse(localStorage.getItem(USERS_KEY)) || [];

  const user = users.find(
    (item) =>
      item.ciudad === loginData.ciudad &&
      item.nombre === loginData.nombre &&
      item.contrasena === loginData.contrasena
  );

  if (!user) {
    throw new Error('Datos incorrectos');
  }

  return {
    message: 'Inicio de sesión correcto',
    user: {
      id_usuario: user.id_usuario,
      nombre: user.nombre,
      apellido: user.apellido,
      ciudad: user.ciudad,
      gmail: user.gmail
    }
  };
};