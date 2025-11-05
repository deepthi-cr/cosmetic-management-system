package com.xworkz.Project.repo;

import com.xworkz.Project.entity.AdminEntity;
import com.xworkz.Project.entity.ProductEntity;
import com.xworkz.Project.entity.RegisterEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import java.util.List;

@Repository
public class ProjectRepo {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("project_Db");

    public void saveUser(RegisterEntity entity) {
        System.out.println("SOP: ProjectRepo.saveUser() - Started");
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
            System.out.println("SOP: ProjectRepo.saveUser() - User saved successfully");
        } catch (PersistenceException e) {
            System.out.println("SOP: ProjectRepo.saveUser() - Error saving user: " + e.getMessage());
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public AdminEntity getByEmail(String email) {
        System.out.println("SOP: ProjectRepo.getByEmail() - Started with email: " + email);
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            AdminEntity entity = (AdminEntity) em.createNamedQuery("getByEmail")
                    .setParameter("email", email)
                    .getSingleResult();
            System.out.println("SOP: ProjectRepo.getByEmail() - Admin found: " + (entity != null));
            return entity;
        } catch (NoResultException e) {
            System.out.println("SOP: ProjectRepo.getByEmail() - No admin found with email: " + email);
            return null;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.getByEmail() - Error: " + e.getMessage());
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public boolean checkEmail(String email, String psw) {
        System.out.println("SOP: ProjectRepo.checkEmail() - Started with email: " + email);
        try {
            AdminEntity entity = getByEmail(email);
            if (entity != null) {
                boolean isValid = entity.getPsw().equals(psw);
                System.out.println("SOP: ProjectRepo.checkEmail() - Password validation: " + isValid);
                return isValid;
            }
            System.out.println("SOP: ProjectRepo.checkEmail() - Admin not found");
            return false;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.checkEmail() - Error: " + e.getMessage());
            return false;
        }
    }

    public RegisterEntity getByUser(String email) {
        System.out.println("SOP: ProjectRepo.getByUser() - Started with email: " + email);
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            RegisterEntity entity = (RegisterEntity) em.createNamedQuery("getByUser")
                    .setParameter("email", email)
                    .getSingleResult();
            System.out.println("SOP: ProjectRepo.getByUser() - User found: " + (entity != null));
            return entity;
        } catch (NoResultException e) {
            System.out.println("SOP: ProjectRepo.getByUser() - No user found with email: " + email);
            return null;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.getByUser() - Error: " + e.getMessage());
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public boolean checkUserEmail(String email, String psw) {
        System.out.println("SOP: ProjectRepo.checkUserEmail() - Started with email: " + email);
        try {
            RegisterEntity entity = getByUser(email);
            if (entity != null) {
                boolean isValid = entity.getPassword().equals(psw);
                System.out.println("SOP: ProjectRepo.checkUserEmail() - Password validation: " + isValid);
                return isValid;
            }
            System.out.println("SOP: ProjectRepo.checkUserEmail() - User not found");
            return false;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.checkUserEmail() - Error: " + e.getMessage());
            return false;
        }
    }

    public List<RegisterEntity> getAll() {
        System.out.println("SOP: ProjectRepo.getAll() - Started");
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            List<RegisterEntity> entity = em.createNamedQuery("getAll")
                    .getResultList();
            System.out.println("SOP: ProjectRepo.getAll() - Total users found: " + entity.size());
            return entity;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.getAll() - Error: " + e.getMessage());
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void save(ProductEntity entity) {
        System.out.println("SOP: ProjectRepo.saveUser() - Started");
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
            System.out.println("SOP: ProjectRepo.saveUser() - User saved successfully");
        } catch (PersistenceException e) {
            System.out.println("SOP: ProjectRepo.saveUser() - Error saving user: " + e.getMessage());
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ProductEntity> getAllProduct() {
        System.out.println("SOP: ProjectRepo.getAll() - Started");
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            List<ProductEntity> entity = em.createNamedQuery("getAllProduct")
                    .getResultList();
            System.out.println("SOP: ProjectRepo.getAll() - Total users found: " + entity.size());
            return entity;
        } catch (Exception e) {
            System.out.println("SOP: ProjectRepo.getAll() - Error: " + e.getMessage());
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}