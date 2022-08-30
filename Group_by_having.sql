--GROUP BY -- HAVİNG --
/*having ifadesinin işlevi where ifadesininkine cok benziyor ancak 
kümeleme fonksiyonları ile where ifadesi birlikte kullanılmadığından having ifadesine ihtiyaç duyulmuştur.
Group by ile kullanılır. Grouplamadan sonraki şart için group by dan sonra Having kullanılır.
*/

--maas ortalamsı 3000 den fazla olan ulkelerdeki erkek calısanların maas ortalaması.

select ulke, round(avg(maas)) as maas_ortalamasi from personel 
where cinsiyet='E'
group by ulke having avg(maas)>3000