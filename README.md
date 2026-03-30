
# Rapport de TP : Automatisation du Cycle de Vie Spring Boot avec Bash

## 1. Presentation du Projet
Ce projet, developpe sous le GroupId `ma.ens`, vise a automatiser l'ensemble des operations d'administration d'une application Spring Boot (`springbash`) au sein d'un environnement Linux. L'objectif est de simuler un environnement de production ou les manipulations manuelles via un IDE sont proscrites au profit de scripts robustes et reproductibles.

## 2. Objectifs Techniques Atteints
- **Industrialisation du Build** : Utilisation de Maven en ligne de commande pour la compilation et le packaging (JAR).
- **Gestion Avancee des Processus** : Maitrise des commandes `nohup`, `&`, `ps`, `awk` et `kill` pour controler l'execution en arriere-plan.
- **Supervision et Monitoring** : Mise en place de journaux d'evenements (logs) et utilisation de Spring Boot Actuator pour le healthcheck.
- **Maintenance Automatisée** : Scripts d'archivage des logs pour la gestion de l'espace disque.

## 3. Analyse des Resultats et Scripts

### Automatisation du Lancement (run.sh)
Le script utilise `nohup` pour garantir que l'application ne s'arrete pas lors de la deconnexion de l'utilisateur. La redirection `2>&1` est cruciale car elle fusionne les erreurs avec la sortie standard dans `app.log`, offrant une vue unifiee de l'etat du serveur.

### Arret Securise (stop.sh)
L'extraction dynamique du PID via `ps aux | grep 'spring-boot:run' | awk '{print $2}'` permet de cibler precisement l'instance a arreter sans affecter d'autres services systeme. L'usage de `kill -9` assure une liberation immediate du port 8085.

### Deploiement Continu (deploy.sh)
Ce script combine le nettoyage (`clean`), la compilation (`package`) et le lancement du JAR. L'omission des tests (`-DskipTests`) accelere le cycle de deploiement en environnement de test, tandis que le lancement direct via `java -jar` est plus performant que `mvn spring-boot:run` pour la production.

### Supervision (healthcheck.sh & logs.sh)
L'integration de `curl` sur l'endpoint `/actuator/health` permet de verifier non seulement que le port est ouvert, mais que le contexte Spring est correctement initialise et operationnel.

## 4. Guide d'Utilisation

### Configuration Initiale
Accorder les permissions d'execution :
```bash
chmod +x scripts/*.sh
```

### Commandes de Gestion
- **Demarrer** : `./scripts/run.sh`
- **Verifier les logs** : `./scripts/logs.sh`
- **Verifier l'etat de sante** : `./scripts/healthcheck.sh`
- **Deployer une mise a jour** : `./scripts/deploy.sh`
- **Archiver les logs** : `./scripts/archive_logs.sh`
- **Arreter** : `./scripts/stop.sh`

## 5. Conclusion
Ce TP demontre qu'une application Spring Boot peut etre geree comme un service systeme autonome. Ces competences sont les fondations necessaires pour l'adoption de pratiques DevOps plus avancees comme la containerisation avec Docker ou l'orchestration avec Kubernetes.
