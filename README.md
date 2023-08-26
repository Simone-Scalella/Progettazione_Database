# L’uso intelligente dei dati facilita il lavoro
Di seguito saranno riportati tutti gli step di progettazione che hanno portato alla realizzazione di un database per un'azienda.<br />
La seguente descrizione ha lo scopo di fornire una panoramica generale sul lavoro svolto. Per ulteriori dettagli e approfondimenti invitiamo alla lettura della seguente [relazione](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/Relazione_azienda_scang.pdf).<br />
Tutto il codice implementato è presente all'interno di questo [file](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/azienda_scang.sql).<br />
Facendo l'import del file precedente è possibile avere una copia, già popolata, del database che abbiamo realizzato.

## Analisi dei requisiti

### Acquisizione delle informazioni
In questa fase preliminare si vanno a raccogliere i requisiti che dovrà avere il database intervistando i lavoratori che operano all'interno dell'azienda. Ognuno di essi fornisce il suo punto di vista su determinate dinamiche aziendale e descrive i problemi ad esse collegate.
Le sole interviste non sufficienti, infatti, è necessario anche supervisionare, sempre nel rispetto della privacy, alcuni documenti aziendali, come bolle, fatture e buste paga, che permettono di chiarire e comprendere meglio determinate dinamiche e situazioni.
Di seguito riportiamo una rappresentazione grafica dei processi interni all'azienda.
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/Analisi%20dei%20processi%20interni.png)

### Requisiti espressi nel linguaggio naturale
Successivamente alle interviste e alla ricezione dei documenti, dopo un’attenta analisi delle informazioni in nostro possesso si è stati in grado di identificare il target del progetto. L'obiettivo è realizzare un database che organizzi i dati di un’azienda tessile che si occupa di acquisire merce semilavorata, per poi effettuarci ulteriori lavorazioni fino al raggiungimento del prodotto finito.

### Dizionario dei termini
Questo dizionario serve per rendere più comprensibile alcuni termini che verranno utilizzati all’interno della documentazione.
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/dizionario%20termini.png)

### Eliminazione delle ambiguit`a presenti
Non sono riscontrabili ambiguità che necessitano di ulteriori spiegazioni.

### Strutturazione dei requisiti
Si dovranno gestire dunque i dati relativi ai fornitori,clienti, dipendenti, commissione del lavoro, e sulla commessa la relativa documentazione,bisogna anche gestire i dati relativi alla contabilità.

## Progettazione Concettuale
