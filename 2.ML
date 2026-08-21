import pandas as pd

data = pd.DataFrame([
    ['Sunny', 'Warm', 'Normal', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Rainy', 'Cold', 'High', 'Strong', 'Warm', 'Change', 'No'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Cool', 'Change', 'Yes']
], columns=['Sky', 'Temperature', 'Humidity', 'Wind', 'Water', 'Forecast', 'EnjoySport'])

attributes = data.columns[:-1]

S = ['0'] * len(attributes)
G = [['?'] * len(attributes)]

for _, row in data.iterrows():

    example = list(row[:-1])
    target = row[-1]

    if target == 'Yes':

        # Remove inconsistent hypotheses from G
        G = [
            g for g in G
            if all(g[i] == '?' or g[i] == example[i] for i in range(len(attributes)))
        ]

        # Generalize S
        if S == ['0'] * len(attributes):
            S = example.copy()
        else:
            for i in range(len(attributes)):
                if S[i] != example[i]:
                    S[i] = '?'

    else:
        # Specialize G
        new_G = []

        for g in G:
            for i in range(len(attributes)):
                if g[i] == '?':
                    if S[i] != '?':
                        new_g = g.copy()
                        new_g[i] = S[i]

                        if new_g not in new_G:
                            new_G.append(new_g)

        G = new_G

print("Final Specific Boundary S:")
print(S)

print("\nFinal General Boundary G:")
for g in G:
    print(g)
