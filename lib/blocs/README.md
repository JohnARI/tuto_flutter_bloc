# lib/blocs/README.md

## Dossier "blocs"
Le dossier "blocs" est un endroit spécial dans notre application où nous gérons la logique de gestion des données et des états. Il est utilisé lorsque nous utilisons le modèle de conception BLoC (Business Logic Component) pour organiser notre code.

## Les states
Le "state" représente l'état actuel de notre application ou d'une fonctionnalité spécifique. Il peut contenir des informations telles que les données récupérées, les erreurs survenues ou tout autre état pertinent. Le state est généralement représenté sous forme d'objet ou d'énumération. Par exemple, dans une application de liste d'articles, le state pourrait être "Liste chargée", "En cours de chargement" ou "Erreur de chargement".

### Les events
Les "events" sont des événements déclenchés par l'utilisateur ou par d'autres actions dans l'application. Ils représentent des actions spécifiques qui nécessitent une réaction de la part du bloc. Par exemple, un événement peut être "Charger les articles", "Ajouter un nouvel article" ou "Supprimer un article".

### Les blocs
Le "bloc" est la classe centrale qui orchestre la logique métier en réaction aux événements et en mettant à jour le state. Le bloc reçoit les events, les traite en effectuant des opérations nécessaires telles que l'appel à des services, la manipulation des données, etc., puis émet un nouveau state correspondant à l'état actuel. Il utilise des flux de données (streams) pour envoyer le state aux parties de l'application qui ont besoin de le connaître.

## Utilité du dossier "blocs"
Le modèle de conception BLoC (design pattern) permet une gestion claire et réactive des états et des événements. Les blocs agissent comme des contrôleurs qui reçoivent les événements, effectuent des opérations en fonction de ceux-ci et émettent les états appropriés. Cela permet de séparer la logique métier de l'interface utilisateur, facilitant ainsi le développement, la maintenance et les tests de notre application.
