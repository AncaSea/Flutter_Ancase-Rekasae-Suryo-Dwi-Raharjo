# Section 15 : Flutter Layout

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Pada Section 15 yang membahas Flutter Layout ini pertama-tama dijelaskan tentang

### **Apa itu Layout**

>Layout merupakan sebuah kerangka yang di desain untuk tempat widget-widget. Layout berbentuk widget yang bertujuan untuk mengatur tata letak widget-widget.

Layout mempunyai jenis single-child layout dan dan multi-child layout. Berikut penjelasannya :

#### **Single-child Layout**

>Single-child layout seperti namanya, dimana widget di layout ini hanya mempunyai satu widget child di dalamnya. Contoh nya seperti :

1. Container
   Digunakan untuk membuat box yang membungkus widget lain serta memiliki margin, padding, dan border. Contoh penggunaan code nya seperti :
   ```cs
   Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration:: BoxDecoration(
        border: Border.all(),
    ),
    child: const Text('Hello World'),
   );
   ```
2. Center
   Seperti container, center digunakan untuk membuat sebuah box yang membungkus widget lainnya namun bedanya center akan memenuhi lebar dan tinggi ruang agar widget yang dibungkus berada di tengah. Contoh penggunaan code nya seperti :
   ```cs
   Center(
    child: Text('teks'),
   );
   ```
3. SizedBox
   Digunakan untuk mengatur lebar dan tinggi box seperti container tapi versi yang lebih sederhananya. Berikut contoh penggunaan code nya :
   ```cs
   SizedBox(
    width: 100,
    height: 150,
    child: Text('Hello World'),
   );
   ```

#### **Multi-child Layout**

>Multi-child layout merupakan layout yang dapat memiliki lebih dari satu widget di dalamnya. Contoh nya seperti :

1. Column
   Digunakan mengatur tempat widgets secara vertikal. Contoh penggunaannya seperti :
   ```cs
    Column(
        children: const [
            Text('H'),
            Text('E'),
            Text('L'),
            Text('L'),
            Text('O'),
        ],
    );
   ```
2. Row
   Digunakan untuk mengatur tempat widgets secara horizontal. Contoh penggunaanya seperti :
    ```cs
    Row(
        children: const [
            Text('H'),
            Text('E'),
            Text('L'),
            Text('L'),
            Text('O'),
        ],
    );
   ```
3. ListView
   Digunakan untuk mengatur widgets agar berbentuk seperti list dan memiliki fungsi scroll. Contoh penggunaan code nya :
   ```cs
    ListView(
        children: [
            Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: const Text('Hello'),
            )
        ],
    );
   ```
4. GridView
   Digunakan untuk widgets yang bisa berbentuk seperti galeri. Contoh penggunaannya code nya :
   ```cs
    GridView.count(
      crossAxisCount: 2,
      children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Hello'),
        ),
      ],
    );
   ```

---