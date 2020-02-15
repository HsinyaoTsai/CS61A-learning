from reader import read
from expr import LambdaExpr, global_env

env = global_env.copy()
read('lambda x:add(x, 3)').eval(env)