# Section 3 : Basic Version and Branch Management (Git)

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## Task

### Task 1

> Berikut pembuatan repository yang saya buat langsung di Github :

![screenshot make repo](Screenshot/../../Screenshot/Screenshot_Membuat_Repositories.png)

---

### Task 2

> Branching dilakukan dengan menggunakan code
<br> 
`git branch <"nama branch">` 
<br>
Berikut untuk hasil branch yang sudah dibuat sesuai task :

![screenshot make branch](Screenshot/../../Screenshot/Screenshot_Membuat_Branch.png)

---

### Task 3

> Dalam menggunakan **Git** untuk melakukan proses handle source code menggunakan beberapa code, yaitu : 

- `git pull origin <"branch">`, berfungsi untuk menarik atau mengambil source dari branch yang diinginkan. Berikut implementasi di terminal :

![screenshot doing pull](Screenshot/../../Screenshot/Screenshot_GitPull.png)

- `git stash`, berfungsi untuk menyimpan sementara code pada branch yang di remote dan belum di add ke stage. Berikut implementasi di terminal :

![screenshot doing stash](Screenshot/../../Screenshot/Screenshot_GitStash.png)

- `git merge`, berfungsi untuk menggabungkan dua file yang diinginkan, selain itu ada **dua tipe** merge yaitu :
  - *non fast forward* (--no-ff), akan tetap melacak merge yang dilakukan di branch.
  - *fast forward* (--ff), melebur graph git menjadi satu atau dengan kata lain tidak akan melacak merge yang dilakukan. 
  
  Berikut implementasi di terminal :

![screenshot doing merge](Screenshot/../../Screenshot/Screenshot_GitMerge.png)

- `git push origin <"branch">`, berfungsi untuk memasukkan code yang di modified ke dalam repository yang diremote. Sebelum push harus terlebih dahulu menginputkan di terminal code `git add` yang berfungsi memasukkan code modified ke **staging area**, kemudian input `git commit -m "komentar"` yang berfungsi untuk menaruh komentar push yang akan dilakukan dan terakhir baru bisa di push. Berikut implementasi di terminal :

![screenshot doing push](Screenshot/../../Screenshot/Screenshot_GitAdd,GitCommit,GitPush.png)

---

### Task 4

> Pada saat melakukan `git merge` ada salah satu kasus yang nanti akan sering ditemui yaitu conflict merge.

Yang berarti ada code yang saling bertubrukan pada line yang sama yang sedang di merge tersebut. seperti :

![screenshot conflict merge](Screenshot/../../Screenshot/Screenshot_Conflict_Merge.png)

Gambar diatas menunjukkan conflict merge dari branch featureB ke featureA. Pada kasus tersebut penanganan conflict nya adalah pilih **Accept Both Change** karena saya ingin keep kedua code yang bertabrakan tersebut lalu merapikannya.

---

### Task 5

> `git merge` mempunyai dua tipe seperti yang dijelaskan di task 3 tadi yaitu *no fast forward* dan *fast forward*.

Berikut implementasi salah satu tipe merge yaitu *no fast forward* di terminal :

![screenshot doing merge --no-ff](Screenshot/../../Screenshot/Screenshot_GitMerge.png)

---

<br>

> ### note :
> berikut ini adalah gambar graph dari perintah-perintah git yang dilacak oleh git graph :
> ![screenshot git graph](Screenshot/../../Screenshot/Screenshot_GitGraph.png)