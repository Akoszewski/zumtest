from sklearn import tree
from matplotlib import pyplot as plt
from sklearn.metrics import accuracy_score

x = [[1,1],[1,2],[1,3],[2,1],[2,2],
    [1,1],[1,2],[1,3],[2,2],[2,3]]
y = [0]*5 + [1]*5

clf = tree.DecisionTreeClassifier(criterion = "entropy",
                                  splitter = "best",
                                  min_samples_split = 3)
clf.fit(x,y)
fig = plt.figure()
_ = tree.plot_tree(clf,
                   feature_names=["a1", "a2"],
                   class_names=["0", "1"])
plt.show()
y_pred = clf.predict(x)
print("accuracy: " + str(accuracy_score(y, y_pred)))
