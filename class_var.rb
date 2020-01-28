## クラス変数はクラスメソッド内でもインスタンスメソッド内でも共有される
## なおかつスーパークラスとサブクラスでも共有される。

class Hoge
  @@foo = 'bar'

  def self.foo
    @@foo
  end

  def initialize(foo)
    @@foo = foo
  end

  def foo
    @@foo
  end
end

class Buz < Hoge
  @@foo = 'fuga'

  def self.foo
    @@foo
  end

  def upcase_foo
    @@foo.upcase
  end
end

# Buzクラスを定義したタイミングで@@fooが "fuga"に変更される
Hoge.foo   #=> "fuga"
Buz.foo    #=> "fuga"

hoge = Hoge.new('Piyo')
hoge.foo   #=> "Piyo"

# Hoge.newのタイミングで@@fooが "Piyo"に変更される
hoge.foo  #=> "Piyo"
Buz.foo   #=> "Piyo"

buz = Buz.new('Fizz')
buz.foo        #=> "Fizz"
buz.upcase_foo #=> "FIZZ"

# Buz.newのタイミングで@@fooが "fizz"に変更される
hoge.foo  #=> "Fizz"
Hoge.foo  #=> "Fizz"
Buz.foo   #=> "Fizz"