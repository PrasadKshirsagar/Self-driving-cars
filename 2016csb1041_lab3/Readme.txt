#---------------------------------# for training set X :------------------------------------------------------------

# X[12000][5001]    .....last column is label

N=12000
D = 5001
X = [[0 for x in range(D)] for y in range(N)]

i=0
l=0
while (1):
	if(saved_language[l] == 'english'):
		tmp = "'''"+str(saved_body[l])+"'''"
		tmp = tmp.replace('\n', ' ')
		words = word_tokenize(tmp.decode('utf-8'))
		filtered_sentence = [w1 for w1 in words if not w1 in stop_words]
		us = set(filtered_sentence)

		count_dict = {}

		# adding count for naive bayes classifier :
		for v in filtered_sentence:
			if v in count_dict:
				count_dict[v] += 1
			else:
				count_dict[v] = 1

		# giving label
		X[i][5000] = 1

		for k in range(0,5000):
			if(selected_features[k] in count_dict):   # changed here
				X[i][k] = count_dict[selected_features[k]]  # changed here
			else :
				X[i][k] = 0
		i = i+1
		if(i == 6000):
			break

	l = l + 1	



i = 0
while (i < 6000):
	tmp = "'''"+str(saved_true_body[i])+"'''"
	tmp = tmp.replace('\n', ' ')
	words = word_tokenize(tmp.decode('utf-8'))
	filtered_sentence = [w1 for w1 in words if not w1 in stop_words]
	us = set(filtered_sentence)

	count_dict = {}

	# adding count for naive bayes classifier :
	for v in filtered_sentence:
		if v in count_dict:
			count_dict[v] += 1
		else:
			count_dict[v] = 1

	X[i+6000][5000] = 0
	for k in range(0,5000):
		if(selected_features[k] in count_dict):    # changed here 
			X[i+6000][k] = count_dict[selected_features[k]]    # changed here
		else :
			X[i+6000][k] = 0
	i = i+1	




# writing X into file

''''
for j in range(0,N):
	for k in range(0,D):
		f.write(str(X[j][k])+" ")

	f.write("\n")	

f.close()		

'''





#---------------------------------# for test set X_test :------------------------------------------------------------

# X_test[6000][5000]

N1=6000
D1 = 5001
X_test = [[0 for x in range(D1)] for y in range(N1)]

i=0
l=0
while (1):
	if(saved_language[l+7000] == 'english'):
		tmp = "'''"+str(saved_body[l+7000])+"'''"
		tmp = tmp.replace('\n', ' ')
		words = word_tokenize(tmp.decode('utf-8'))
		filtered_sentence = [w1 for w1 in words if not w1 in stop_words]
		us = set(filtered_sentence)

		count_dict = {}

		# adding count for naive bayes classifier :
		for v in filtered_sentence:
			if v in count_dict:
				count_dict[v] += 1
			else:
				count_dict[v] = 1

		# giving label
		X_test[i][5000] = 1

		for k in range(0,5000):
			if(selected_features[k] in count_dict):          # changed here
				X_test[i][k] = count_dict[selected_features[k]]        # changed here
			else :
				X_test[i][k] = 0
		i = i+1
		if(i == 3000):
			break

	l = l + 1	




i = 0
while (i < 3000):
	tmp = "'''"+str(saved_true_body[i+7000])+"'''"
	tmp = tmp.replace('\n', ' ')
	words = word_tokenize(tmp.decode('utf-8'))
	filtered_sentence = [w1 for w1 in words if not w1 in stop_words]
	us = set(filtered_sentence)

	count_dict = {}

	# adding count for naive bayes classifier :
	for v in filtered_sentence:
		if v in count_dict:
			count_dict[v] += 1
		else:
			count_dict[v] = 1


	X_test[i+3000][5000] = 0
	for k in range(0,5000):
		if(selected_features[k] in count_dict):               # changed here
			X_test[i+3000][k] = count_dict[selected_features[k]]         # changed here
		else : 
			X_test[i+3000][k] = 0
	i = i+1	




# output X & X_test to check 
