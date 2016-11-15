#
# Ant System
#
## The application of Ant System for TSP.

Untuk menjalankan program gunakan file *main.m*. 

Ada 3 data yang digunakan untuk percobaan ini, yaitu:
1. city10.csv
2. berlin52.csv
3. ei51.csv

Jika ingin mengganti data yang digunakan silahkan mengganti nama data yang digunakan pada codingan berikut ini di *main.m*:
```
> cities = csvread('ei51.csv'); 
%ganti 'ei51.csv' menjadi nama file yang diinginkan.
```

Inisialisasi pheromone matrix dilakukan dengan menggunakan rumus: 1/(n*bks) dengan *bks* yang dimaksud adalah *best known solution* .
Constant yang digunakan dalam algoritma ini adalah:
```
alpha = 0.1;
beta = 2;
rho = 0.1;
Q = 1;
```

Jumlah semut yang digunakan adalah sebanyak jumlah kota dan iterasi yang dilakukan adalah sebanyak 1000.
Algoritma ini dimulai dengan penempatan semut-semut di kota berbeda sebagai *start position*. 

Berikut ini adalah penjelasan mengenai fungsi-fungsi yang ada:

`nextCity` digunakan untuk menentukan kota yang akan dituju selanjutnya berdasarkan pheromone matrix
```
> nextCity(p, unVisitedCity)
%p = pheromone matrix
%unVisitedCity = kota-kota yang belum dikunjungi
```


 




## Result



![alt text](https://lh3.googleusercontent.com/q1C_PmuDNE_zrMm5VLqoEAD8sEn6lGiHg6-xtla9iXETkPb58chDmmuuz3m8eEVAlNPoP0TvpIBQV3Q=w1366-h643 "Boxplot")

## Conclusion
