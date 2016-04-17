
# coding: utf-8

# In[1]:

import graphlab


# In[2]:

dat = graphlab.SFrame('data.csv')


# In[36]:

dat


# In[34]:

dat.show()


# In[35]:

dat['Avg'] = (dat['Low'] + dat['Open'] + dat['High'] + dat['Close'])/4 


# In[3]:

train_data,test_data = dat.random_split(.8,seed=0)


# In[38]:

test_data.num_rows()


# In[39]:

train_data.num_rows()


# In[4]:

first_model = graphlab.linear_regression.create(train_data, target='Volume', features=['Open'],validation_set=None)


# In[5]:

first_model.evaluate(test_data)


# In[45]:

import matplotlib.pyplot as plt
get_ipython().magic(u'matplotlib inline')


# In[46]:

plt.plot(test_data['Open'],test_data['Volume'],'.',
        test_data['Open'],first_model.predict(test_data),'-')


# In[6]:

my_features = ['Open', 'Close', 'High', 'Low','Last']


# In[7]:

sec_model = graphlab.linear_regression.create(train_data,target='Volume',features=my_features,validation_set=None)


# In[8]:

sec_model.evaluate(test_data)


# In[13]:

test_data.show()


# In[9]:

test1 = dat[dat['Date']=='22/02/16']


# In[10]:

test1


# In[11]:

print first_model.predict(test1)


# In[12]:

print sec_model.predict(test1)


# In[14]:

test2 = dat[dat['Date']=='02/02/16']


# In[15]:

test2


# In[16]:

print first_model.predict(test2)
print sec_model.predict(test2)


# In[60]:

test3 = dat[dat['Date']=='15/12/15']


# In[61]:

test3


# In[62]:

print first_model.predict(test3)
print sec_model.predict(test3)


# In[51]:

sec_model.get('coefficients')


# In[ ]:



