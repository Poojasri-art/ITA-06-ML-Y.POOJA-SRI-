
data = [
    ['Sunny', 'Warm', 'Normal', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Rainy', 'Cold', 'High', 'Strong', 'Warm', 'Change', 'No'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Cool', 'Change', 'Yes']
]

hypothesis = None
for sample in data:
    if sample[-1] == "Yes":
        hypothesis = sample[:-1]
        break

for sample in data:
    if sample[-1] == "Yes":
        for i in range(len(hypothesis)):
            if hypothesis[i] != sample[i]:
                hypothesis[i] = '?'

print("Final Hypothesis:")
print(hypothesis)
