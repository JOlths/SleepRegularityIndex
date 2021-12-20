import numpy as numpy
import pandas as pd

def SRI_score(epochs_per_day=1440, sleep_data):
	''' Calculate SRI score '''
	pass

def explore_data(sleep_data):
	''' Exploring dataset for length, missing values, etc.'''
	
	# check if dataset is a python dataframe
	assert type(sleep_data) == pd.DataFrame()

	# check for missing values
	print(f"{np.sum(np.isna(sleep_data))} missing values found")

	#

	


if __name__ == "__main__":
	pass