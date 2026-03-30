# TP Automatisation Spring Boot avec Bash

## Description des resultats
Ce projet demontre l'automatisation complete du cycle de vie d'une application Java Spring Boot. 
L'utilisation de scripts Bash permet de s'affranchir de l'IDE pour les phases de build, execution et supervision.

### Resultats obtenus :
1. **Isolation du processus** : L'application s'execute en arriere-plan via `nohup`, permettant au serveur de rester actif apres la fermeture de la session SSH.
2. **Gestion des flux** : Les sorties standards et d'erreurs sont redirigees vers des fichiers de logs distincts (`app.log`, `deploy.log`), facilitant le debuggage.
3. **Controle du cycle de vie** : Le script `stop.sh` identifie dynamiquement le PID du processus pour un arret propre.
4. **Supervision** : Le script `healthcheck.sh` utilise Spring Actuator pour verifier l'etat de sante de l'application via HTTP.
5. **Maintenance** : L'archivage automatique des logs permet une gestion efficace de l'espace disque sur le serveur.

### Structure du projet :
- `src/` : Code source Java (Spring Boot).
- `scripts/` : Ensemble des outils d'automatisation Bash.
- `pom.xml` : Configuration Maven avec dependances Web, JPA et Actuator.

### Instructions :
1. Donner les droits : `chmod +x scripts/*.sh`
2. Lancer : `./scripts/run.sh`
3. Verifier : `./scripts/healthcheck.sh`
4. Arreter : `./scripts/stop.sh`
