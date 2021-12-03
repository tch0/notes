import Control.Monad.State

-- example of State
-- stack

type Stack a = [a]

pop :: Stack a -> (a, Stack a)
pop [] = undefined
pop (x:xs) = (x, xs)

push :: a -> Stack a -> ((), Stack a)
push a xs = ((), a:xs)

stackMainOp :: Num a => Stack a -> (a, Stack a)
stackMainOp stack = let
    ((), newStack1) = push 3 stack
    (a, newStack2) = pop newStack1
    in pop newStack2
{-
>>> stackMainOp [1, 2, 3]
(1,[2,3])
-}

{-
>>> :i State
type State :: * -> * -> *
type State s = StateT s Identity :: * -> *
  	-- Defined in ‘Control.Monad.Trans.State.Lazy’

>>> :i StateT
type role StateT nominal representational nominal
type StateT :: * -> (* -> *) -> * -> *
newtype StateT s m a = StateT {runStateT :: s -> m (a, s)}
  	-- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] (Functor m, Monad m) => Applicative (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] Functor m => Functor (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] Monad m => Monad (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] MonadPlus m => MonadPlus (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] MonadFail m => MonadFail (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] MonadFix m => MonadFix (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] MonadIO m => MonadIO (StateT s m)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’
instance [safe] Monad m => MonadState s (StateT s m)
  -- Defined in ‘Control.Monad.State.Class’
instance [safe] MonadTrans (StateT s)
  -- Defined in ‘Control.Monad.Trans.State.Lazy’

>>> :t runState
runState :: State s a -> s -> (a, s)
>>> :t state
state :: MonadState s m => (s -> (a, s)) -> m a
-}

pop' :: State (Stack a) a
pop' = state $ \(x:xs) -> (x, xs)

push' :: a -> State (Stack a) ()
push' a = state $ \xs -> ((), a:xs)

stackMainOp' :: State (Stack Int) Int
stackMainOp' = do
    push' 3
    pop'
    pop'

{-
>>> runState stackMainOp' [1, 2, 3]
(1,[2,3])
>>> runState (push' 10 >> push' 100 >> pop') [1, 2, 3]
(100,[10,1,2,3])
-}

stackComplexOp :: State (Stack Int) ()
stackComplexOp = do
    a <- pop'
    if a >= 10 then do
        push' 100
    else do
        push' 1000
{-
>>> runState stackComplexOp [1, 2, 10]
((),[1000,2,10])
>>> runState stackComplexOp [10, 1, 2]
((),[100,1,2])
-}