# Сложность алгортима O(n), поскольку возможное прохождение только один раз по всему массиву
def find_sum(array, target):
    
    d = {} # создаем словарь 
     
    for i in range(len(array)): #выполняем цикл for по словарю
        temp = target - array[i] #считаем разницу между суммой и элементом массива
        if (temp in d.keys()): # если эта разница присутствует в ключе нашего словаря
            return d.get(temp), i #выыводим индексы
        else:
            d[array[i]] = i #иначе добавляем в словарь, где ключом является элемент словаря, а индекс значением. Это делаем, поскольку необходимо вывести индексы
