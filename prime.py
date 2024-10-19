def is_prime(num):
    if num <= 1:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

def get_n_primes(end):
    end = max(end, 0)
    n_primes = 0
    for num in range(1, end + 1):
        if is_prime(num):
            n_primes += 1
    return n_primes

i = 1000
while i <= 1000000 :
    print('Looking for the number of primes between 1 and', i)
    n = get_n_primes(i)
    print('Ouf! Found', n, 'prime numbers')
    i +=1000
    print('-------------------------------------------------')

