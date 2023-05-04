const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const uuid = require('uuid');
const jwt = require('jsonwebtoken');
const db = require('../lib/db.js');

const userMiddleware = require('../middleware/usuarios.js');


router.post('/sign-up', userMiddleware.validateRegister, (req, res, next) => {
  db.query(
    `SELECT * FROM usuario WHERE LOWER(username) = LOWER(${db.escape(
      req.body.username
    )});`,
    (err, result) => {
      if (result.length) {
        return res.status(409).send({
          msg: 'Ya existe un usuario con esa Matricula/ID'
        });
      } else {
        // username is available
        bcrypt.hash(req.body.password, 10, (err, hash) => {
          if (err) {
            return res.status(500).send({
              msg: err
            });
          } else {
            // has hashed pw => add to database
            db.query(
              `INSERT INTO usuario (id, username, password, registered) VALUES ('${uuid.v4()}', ${db.escape(
                req.body.username
              )}, ${db.escape(hash)}, now())`,
              (err, result) => {
                if (err) {
                  throw err;
                  return res.status(400).send({
                    msg: err
                  });
                }
                return res.status(201).send({
                  msg: 'Usuario Registrado Correctamente'
                });
              }
            );
          }
        });
      }
    }
  );
});

router.post('/update-pw', (req, res, next) => {
  bcrypt.hash(req.body.password, 10, (err, hash) => {
    if (err) {
      return res.status(500).send({
        msg: err
      });
    } else {
      // has hashed pw => add to database
      db.query(
        `UPDATE usuario SET password = ${db.escape(hash)} WHERE username = ${db.escape(req.body.username)}`,
        (err, result) => {
          if (err) {
            throw err;
            return res.status(400).send({
              msg: err
            });
          }
          return res.status(201).send({
            msg: 'Contraseña Actualizada Correctamente'
          });
        }
      );
    }
  });
});

router.post('/reset', (req, res, next) => {
  bcrypt.hash(req.body.password, 10, (err, hash) => {
    if (err) {
      return res.status(500).send({
        msg: err
      });
    } else {
      // has hashed pw => add to database
      db.query(
        `UPDATE usuario SET password = ${db.escape(hash)} WHERE username = ${db.escape(req.body.username)}`,
        (err, result) => {
          if (err) {
            throw err;
            return res.status(400).send({
              msg: err
            });
          }
          return res.status(201).send({
            msg: 'Usuario Restablecido Correctamente'
          });
        }
      );
    }
  });
});

router.post('/login', (req, res, next) => {
  db.query(
    `SELECT * FROM usuario WHERE username = ${db.escape(req.body.username)};`,
    (err, result) => {
      // user does not exists
      if (err) {
        throw err;
        return res.status(400).send({
          msg: err
        });
      }
      if (!result.length) {
        return res.status(401).send({
          msg: 'Matricula/ID o Contraseña incorrectos'
        });
      }
      // check password
      bcrypt.compare(
        req.body.password,
        result[0]['password'],
        (bErr, bResult) => {
          // wrong password
          if (bErr) {
            throw bErr;
            return res.status(401).send({
              msg: 'Matricula/ID o Contraseña incorrectos'
            });
          }
          if (bResult) {
            const token = jwt.sign({
                username: result[0].username,
                userId: result[0].id
              },
              'SECRETKEY', {
                expiresIn: '7d'
              }
            );
            db.query(
              `UPDATE usuario SET last_login = now() WHERE id = '${result[0].id}'`
            );
            return res.status(200).send({
              msg: 'Inicio de Sesión Correcto',
              token,
              user: result[0]
            });
          }
          return res.status(401).send({
            msg: 'Matricula/ID o Contraseña incorrectos'
          });
        }
      );
    }
  );
});

router.get('/secret-route', userMiddleware.isLoggedIn, (req, res, next) => {
  console.log(req.userData);
  res.send('Inicio de sesión Correcto');
});

module.exports = router;